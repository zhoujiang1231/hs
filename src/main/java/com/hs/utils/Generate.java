package com.hs.utils;

/**
 * Created by zj on 2018年1年5日.
 */

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
    public class Generate {
        public void generator() throws Exception{
            List<String> warnings = new ArrayList<String>();
            boolean overwrite = true;
            File configFile = new File("src/generator.xml");
            ConfigurationParser cp = new ConfigurationParser(warnings);
            Configuration config = cp.parseConfiguration(configFile);
            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
                    callback, warnings);
            myBatisGenerator.generate(null);
        }
        public static void main(String[] args) throws Exception {
            try {
                Generate generatorSqlmap = new Generate();
                generatorSqlmap.generator();
                System.out.println("运行成功");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

