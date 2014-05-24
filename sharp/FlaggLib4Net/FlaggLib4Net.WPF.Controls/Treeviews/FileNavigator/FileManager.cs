using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Interop;
using System.Drawing;
using System.IO;


namespace FlaggLib4Net.WPF.Controls.Treeviews.FileNavigator
{
    public static class FileManager
    {
        public static ImageSource GetImageSource(string filename)
        {
            try
            {
                return FileManager.GetImageSource(filename, new Size(16, 16));
            }
            catch
            {
                throw;
            }
        }

        public static ImageSource GetImageSource(string filename, Size size)
        {
            try
            {
                using (var icon = ShellManager.GetIcon(Path.GetExtension(filename), ItemType.File, IconSize.Small, ItemState.Undefined))
                {
                    return Imaging.CreateBitmapSourceFromHIcon(icon.Handle, System.Windows.Int32Rect.Empty, BitmapSizeOptions.FromWidthAndHeight((int)size.Width, (int)size.Height));
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
