package cn.hyb.mapper;

import cn.hyb.pojo.XbHeadicon;
import cn.hyb.pojo.XbHeadiconExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbHeadiconMapper {
    int countByExample(XbHeadiconExample example);

    int deleteByExample(XbHeadiconExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbHeadicon record);

    int insertSelective(XbHeadicon record);

    List<XbHeadicon> selectByExample(XbHeadiconExample example);

    XbHeadicon selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbHeadicon record, @Param("example") XbHeadiconExample example);

    int updateByExample(@Param("record") XbHeadicon record, @Param("example") XbHeadiconExample example);

    int updateByPrimaryKeySelective(XbHeadicon record);

    int updateByPrimaryKey(XbHeadicon record);
}