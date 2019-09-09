package cn.hyb.mapper;

import cn.hyb.pojo.XbArticleAgree;
import cn.hyb.pojo.XbArticleAgreeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbArticleAgreeMapper {
    int countByExample(XbArticleAgreeExample example);

    int deleteByExample(XbArticleAgreeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbArticleAgree record);

    int insertSelective(XbArticleAgree record);

    List<XbArticleAgree> selectByExample(XbArticleAgreeExample example);

    XbArticleAgree selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbArticleAgree record, @Param("example") XbArticleAgreeExample example);

    int updateByExample(@Param("record") XbArticleAgree record, @Param("example") XbArticleAgreeExample example);

    int updateByPrimaryKeySelective(XbArticleAgree record);

    int updateByPrimaryKey(XbArticleAgree record);
}