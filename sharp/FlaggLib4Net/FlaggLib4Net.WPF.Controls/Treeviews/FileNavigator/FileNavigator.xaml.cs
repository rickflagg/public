using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;

namespace FlaggLib4Net.WPF.Controls.Treeviews.FileNavigator
{
    /// <summary>
    /// Interaction logic for FileNavigator.xaml
    /// </summary>
    public partial class FileNavigator : UserControl
    {
        public static RoutedEvent FileSelectedEvent; 


        public FileNavigator()
        {
            InitializeComponent();
            InitializeSelf();
        }

        private void InitializeSelf()
        {
            var drives = DriveInfo.GetDrives();
            foreach (var drive in drives)
            {
                this.tvwExplorer.Items.Add(new FileSystemObjectInfo(drive));
            }
        }

    }
}
