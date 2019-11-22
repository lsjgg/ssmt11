package com.xtkj.pro.dao;

import com.xtkj.pro.entity.Protype;
import com.xtkj.pro.entity.ProtypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProtypeMapper {
    long countByExample(ProtypeExample example);

    int deleteByExample(ProtypeExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Protype record);

    int insertSelective(Protype record);

    List<Protype> selectByExample(ProtypeExample example);

    Protype selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Protype record, @Param("example") ProtypeExample example);

    int updateByExample(@Param("record") Protype record, @Param("example") ProtypeExample example);

    int updateByPrimaryKeySelective(Protype record);

    int updateByPrimaryKey(Protype record);
}