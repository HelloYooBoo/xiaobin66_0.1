package cn.hyb.mapper;

import cn.hyb.pojo.XbArticleLastAltertime;
import cn.hyb.pojo.XbArticleLastAltertimeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbArticleLastAltertimeMapper {
    int countByExample(XbArticleLastAltertimeExample example);

    int deleteByExample(XbArticleLastAltertimeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbArticleLastAltertime record);

    int insertSelective(XbArticleLastAltertime record);

    List<XbArticleLastAltertime> selectByExample(XbArticleLastAltertimeExample example);

    XbArticleLastAltertime selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbArticleLastAltertime record, @Param("example") XbArticleLastAltertimeExample example);

    int updateByExample(@Param("record") XbArticleLastAltertime record, @Param("example") XbArticleLastAltertimeExample example);

    int updateByPrimaryKeySelective(XbArticleLastAltertime record);

    int updateByPrimaryKey(XbArticleLastAltertime record);
}