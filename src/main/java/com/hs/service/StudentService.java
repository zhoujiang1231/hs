package com.hs.service;

import com.hs.entity.Student;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public interface StudentService {
    /**
     * 获取登录用户信息
     * @param student
     * @return
     */
    public Student getLoginStudent(Student student);

    /**
     * 添加用户
     * @param student
     * @return
     */
    public boolean addStudent(Student student);

    /**
     * 修改密码
     * @param student
     * @return
     */
    public boolean updateStudentPsw(Student student);

    /**
     * 批量修改密码
     * @param stuId
     * @return
     */
    public boolean updateStudentPswAll(String[] stuId);

    /**
     * 修改学生信息
     * @param student
     * @return
     */
    public boolean updateStudent(Student student);

    /**
     * 获取所有用户
     * @Param student
     * @return
     */
    public List<Student> getAllStudent(Student student);

    /**
     * 搜索用户
     * @return
     */
    public List<Student> getStudentByCondition(Student student);

    /**
     * 删除用户
     * @param student
     * @return
     */
    public boolean deleteStudent(Student student);

}
