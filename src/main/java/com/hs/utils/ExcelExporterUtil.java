package com.hs.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class ExcelExporterUtil {
	public static String EXPORT_FIELD_TYPE_BOOLEAN= "Boolean";
	public static String EXPORT_FIELD_TYPE_INTEGER= "Integer";
	public static String EXPORT_FIELD_TYPE_DOUBLE= "Double";
	public static String EXPORT_FIELD_TYPE_STRING = "String";
	
	public static Integer CELL_TYPE = null; //列的变量类型，决定导出的类型
	
	public static void setCellType(Integer cellType) {
	    CELL_TYPE = cellType;
	}
	
    public static Object[][] read(File file, int sheetNum) {
        Workbook wb = null;
        InputStream in = null;
        try {
            in = new PushbackInputStream(new FileInputStream(file), 8);
            if (POIFSFileSystem.hasPOIFSHeader(in)) {
                wb = new HSSFWorkbook(in);
            } else {
                wb = new XSSFWorkbook(in);
            }
            Sheet sheet = wb.getSheetAt(sheetNum);
            return getTable(sheet);
        } catch (Exception e) {
            throw new RuntimeException("read excel exception - ", e);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    throw new RuntimeException("close excel exception - ", e);
                }
            }
        }
    }

    private static Object[][] getTable(Sheet sheet) {
        // logger.trace("sheet:{}, firstRowNum:{}, lastRowNum:{}",
        // sheet.getSheetName(), sheet.getFirstRowNum(),
        // sheet.getLastRowNum());
        Object[][] list = new Object[sheet.getLastRowNum() + 1][];
        for (int r = sheet.getFirstRowNum(); r <= sheet.getLastRowNum(); r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                // logger.trace("row:{}, null", r);
                list[r] = null;
            } else {
                // logger.trace("row:{}, firstCellNum:{}, lastCellNum:{}",
                // row.getRowNum(), row.getFirstCellNum(),
                // row.getLastCellNum());
                if (row.getLastCellNum() <= 0) {
                    continue;
                }
                list[r] = new Object[row.getLastCellNum()];
                for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {
                    Cell cell = row.getCell(c);
                    // logger.trace("row:{}, cell:{}, value:{}",
                    // row.getRowNum(), c, cell);
                    list[r][c] = getValueFromCell(cell);
                }
            }
        }
        return list;
    }

    private static final Object getValueFromCell(Cell cell) {
        if (cell == null) {
            return StringUtils.EMPTY;
        }
        if(CELL_TYPE!=null) {
            cell.setCellType(CELL_TYPE);
        }
        Object value = null;
        switch (cell.getCellType()) {
        case Cell.CELL_TYPE_NUMERIC:
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                value = cell.getDateCellValue();
            } else
                value = cell.getNumericCellValue();
            break;
        case Cell.CELL_TYPE_STRING:
            value = cell.getStringCellValue();
            break;
        case Cell.CELL_TYPE_FORMULA:
            double numericValue = cell.getNumericCellValue();
            if (HSSFDateUtil.isValidExcelDate(numericValue)) { // 如果是日期类型
                value = cell.getDateCellValue();
            } else
                value = String.valueOf(numericValue);
            break;
        case Cell.CELL_TYPE_BLANK:
            value = StringUtils.EMPTY;
            break;
        case Cell.CELL_TYPE_BOOLEAN: // Boolean
            value = String.valueOf(cell.getBooleanCellValue());
            break;
        case Cell.CELL_TYPE_ERROR: // Error，返回错误码
            value = String.valueOf(cell.getErrorCellValue());
            break;
        default:
            value = StringUtils.EMPTY;
            break;
        }
        return value;
    }

    public static <T> void exportToExcel(HttpServletRequest request,
                                         HttpServletResponse response, List<T> data, String[] fields,
                                         String[] fieldValue, String[] fieldsType) {
        exportToExcel(request, response, data, fields, fieldValue, fieldsType, null);
    }

    public static <T> void exportToExcel(HttpServletRequest request,
                                         HttpServletResponse response, List<T> data, String[] fields,
                                         String[] fieldValue, String[] fieldsType, String fileName) {

        if (fileName == null || "".equals(fileName)) {
            fileName = System.currentTimeMillis() + ".xls";
        }

        response.reset();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename="
                + fileName);

        try {
            exportToExcel(response.getOutputStream(), data, fields, fieldValue ,fieldsType);
        } catch (IOException e) {
            throw new RuntimeException("export data error", e);
        }
    }

    public static <T> void exportToExcel(OutputStream os, List<T> data,
            String[] fields, String[] fieldValue, String[] fieldsType) {
        if (fields == null || fieldValue == null) {
            throw new RuntimeException("fields or header can't be null.");
        }

        Workbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet("ExportDataList");

        // Create a row and put some cells in it. Rows are 0 based.
        Row headerTitle = sheet.createRow(0);
        int index = 0;
        for (int i = 0; i < fields.length; i++) {
            Cell cell = headerTitle.createCell(index++ % fields.length);
            cell.setCellValue(fieldValue[i]);
        }

        for (int i = 0; i < data.size(); i++) {
            Row row = sheet.createRow(i + 1);
            T o = data.get(i);

            for (int j = 0; j < fields.length; j++) {
                Cell cell = row.createCell(index++ % fields.length);

                try {
                	if(fieldsType[j].equals(ExcelExporterUtil.EXPORT_FIELD_TYPE_INTEGER)) {
                		cell.setCellValue(Integer.parseInt(BeanUtils.getProperty(o, fields[j])));
                	}else if(fieldsType[j].equals(ExcelExporterUtil.EXPORT_FIELD_TYPE_BOOLEAN)) {
                		cell.setCellValue(Boolean.parseBoolean(BeanUtils.getProperty(o, fields[j])));
                	}else if(fieldsType[j].equals(ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE)) {
                		cell.setCellValue(Double.parseDouble(BeanUtils.getProperty(o, fields[j])));
                	}else {
                		cell.setCellValue(BeanUtils.getProperty(o, fields[j]));
                	}
                } catch (Exception e) {
                    throw new RuntimeException("export data error", e);
                }
            }
        }

        try {
            wb.write(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            throw new RuntimeException("export data error", e);
        }
    }
    
    /*public static void main(String[] args) {
        ExcelExporterUtil.setCellType(Cell.CELL_TYPE_STRING);//不管excel里的列是什么变量类型的，都当成字符串直接读出来,如果设置为null，则按照excel里该列原本的类型读取
        Object[][] excel = ExcelExporterUtil.read(new File("C:\\Users\\txy\\Documents\\Tencent Files\\2389679202\\FileRecv\\5000269呼入低消.xls"), 0);
        for(int i =0;i<excel.length;i++) {
            for(int j = 0 ;j<excel[i].length;j++) {
                System.out.print(excel[i][j]+"\t");
            }
            System.out.println();
        }
    }*/
}
