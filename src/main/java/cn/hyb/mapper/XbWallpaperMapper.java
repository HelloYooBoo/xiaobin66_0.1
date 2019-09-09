package cn.hyb.mapper;

import cn.hyb.pojo.XbWallpaper;
import cn.hyb.pojo.XbWallpaperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XbWallpaperMapper {
    int countByExample(XbWallpaperExample example);

    int deleteByExample(XbWallpaperExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(XbWallpaper record);

    int insertSelective(XbWallpaper record);

    List<XbWallpaper> selectByExample(XbWallpaperExample example);

    XbWallpaper selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") XbWallpaper record, @Param("example") XbWallpaperExample example);

    int updateByExample(@Param("record") XbWallpaper record, @Param("example") XbWallpaperExample example);

    int updateByPrimaryKeySelective(XbWallpaper record);

    int updateByPrimaryKey(XbWallpaper record);
}