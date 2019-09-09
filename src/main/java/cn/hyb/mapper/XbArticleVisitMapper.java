package cn.hyb.mapper;

import cn.hyb.pojo.XbArticleVisit;
import cn.hyb.pojo.XbArticleVisitExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbArticleVisitMapper {
    int countByExample(XbArticleVisitExample example);

    int deleteByExample(XbArticleVisitExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbArticleVisit record);

    int insertSelective(XbArticleVisit record);

    List<XbArticleVisit> selectByExample(XbArticleVisitExample example);

    XbArticleVisit selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbArticleVisit record, @Param("example") XbArticleVisitExample example);

    int updateByExample(@Param("record") XbArticleVisit record, @Param("example") XbArticleVisitExample example);

    int updateByPrimaryKeySelective(XbArticleVisit record);

    int updateByPrimaryKey(XbArticleVisit record);
}