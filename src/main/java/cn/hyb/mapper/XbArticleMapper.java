package cn.hyb.mapper;

import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbArticleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbArticleMapper {
    int countByExample(XbArticleExample example);

    int deleteByExample(XbArticleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbArticle record);

    int insertSelective(XbArticle record);

    List<XbArticle> selectByExample(XbArticleExample example);

    XbArticle selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbArticle record, @Param("example") XbArticleExample example);

    int updateByExample(@Param("record") XbArticle record, @Param("example") XbArticleExample example);

    int updateByPrimaryKeySelective(XbArticle record);

    int updateByPrimaryKey(XbArticle record);
}