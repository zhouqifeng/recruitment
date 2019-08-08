package com.qf.admin.mapper;

import com.qf.admin.pojo.po.PersonInfo;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper_znkg {

    void updatePersonInfo_znkg(@Param("personInfo") PersonInfo personInfo);

}
