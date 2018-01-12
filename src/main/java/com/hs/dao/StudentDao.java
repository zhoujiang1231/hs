package com.hs.dao;

import com.hs.entity.Student;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */

public interface StudentDao {
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

}
