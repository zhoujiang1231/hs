package com.hs.mapper;

import com.hs.entity.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Mapper
public interface StudentMapper {
    /**
     * 获取登录学生信息
     * @param student
     * @return
     */
    public Student getLoginStudent(Student student);

    /**
     * 添加学生
     * @param student
     * @return
     */
    public int addStudent(Student student);

    /**
     * 修改学生密码
     * @param student
     * @return
     */
    public int updateStudentPsw(Student student);

    /**
     * 批量修改学生密码
     * @param stuId
     * @return
     */
    public int updateStudentPswAll(String[] stuId);

    /**
     * 修改学生信息
     * @param student
     * @return
     */
    public int updateStudent(Student student);

    /**
     * 获取所有学生
     * @return
     */
    public List<Student> getAllStudent(Student student);

    /**
     * 查询学生
     * @return
     */
    public List<Student> getStudentByCondition(Student student);

    /**
     * 删除学生
     * @param student
     * @return
     */
    public int deleteStudent(Student student);

    /**
     * 删除学生选课记录
     * @param student
     * @return
     */
    public int deleteStudentCourse(Student student);

    /**
     * 检查学号是否唯一
     * @param stuNo
     * @return
     */
    public Student checkUniqueStuNo(String stuNo);

    /**
     * 检查身份证是否唯一
     * @param stuIdcard
     * @return
     */
    public Student checkUniqueIdCard(String stuIdcard);

    /**
     * 查询选择了某门课的所有学生
     * @param cId
     * @return
     */
    public List<Student> getStudentByCourse(Integer cId);

    /**
     * 查询所有的部门
     * @return
     */
    public List<String> getAllDepart();
}
