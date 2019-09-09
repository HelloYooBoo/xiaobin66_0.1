package cn.hyb.mapper;

import cn.hyb.pojo.XbIdolFans;
import cn.hyb.pojo.XbIdolFansExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbIdolFansMapper {
    int countByExample(XbIdolFansExample example);

    int deleteByExample(XbIdolFansExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbIdolFans record);

    int insertSelective(XbIdolFans record);

    List<XbIdolFans> selectByExample(XbIdolFansExample example);

    XbIdolFans selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbIdolFans record, @Param("example") XbIdolFansExample example);

    int updateByExample(@Param("record") XbIdolFans record, @Param("example") XbIdolFansExample example);

    int updateByPrimaryKeySelective(XbIdolFans record);

    int updateByPrimaryKey(XbIdolFans record);
}