package cn.hyb.mapper;

import cn.hyb.pojo.XbPasser;
import cn.hyb.pojo.XbPasserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbPasserMapper {
    int countByExample(XbPasserExample example);

    int deleteByExample(XbPasserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbPasser record);

    int insertSelective(XbPasser record);

    List<XbPasser> selectByExample(XbPasserExample example);

    XbPasser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbPasser record, @Param("example") XbPasserExample example);

    int updateByExample(@Param("record") XbPasser record, @Param("example") XbPasserExample example);

    int updateByPrimaryKeySelective(XbPasser record);

    int updateByPrimaryKey(XbPasser record);
}