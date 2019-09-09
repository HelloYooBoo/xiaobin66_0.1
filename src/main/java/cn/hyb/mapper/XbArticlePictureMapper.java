package cn.hyb.mapper;

import cn.hyb.pojo.XbArticlePicture;
import cn.hyb.pojo.XbArticlePictureExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbArticlePictureMapper {
    int countByExample(XbArticlePictureExample example);

    int deleteByExample(XbArticlePictureExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbArticlePicture record);

    int insertSelective(XbArticlePicture record);

    List<XbArticlePicture> selectByExample(XbArticlePictureExample example);

    XbArticlePicture selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbArticlePicture record, @Param("example") XbArticlePictureExample example);

    int updateByExample(@Param("record") XbArticlePicture record, @Param("example") XbArticlePictureExample example);

    int updateByPrimaryKeySelective(XbArticlePicture record);

    int updateByPrimaryKey(XbArticlePicture record);
}