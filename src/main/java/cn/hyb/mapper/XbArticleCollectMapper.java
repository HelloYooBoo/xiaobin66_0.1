package cn.hyb.mapper;

import cn.hyb.pojo.XbArticleCollect;
import cn.hyb.pojo.XbArticleCollectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbArticleCollectMapper {
    int countByExample(XbArticleCollectExample example);

    int deleteByExample(XbArticleCollectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbArticleCollect record);

    int insertSelective(XbArticleCollect record);

    List<XbArticleCollect> selectByExample(XbArticleCollectExample example);

    XbArticleCollect selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbArticleCollect record, @Param("example") XbArticleCollectExample example);

    int updateByExample(@Param("record") XbArticleCollect record, @Param("example") XbArticleCollectExample example);

    int updateByPrimaryKeySelective(XbArticleCollect record);

    int updateByPrimaryKey(XbArticleCollect record);
}