using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Xml.Serialization;

namespace FlaggLib4Net.WPF.Controls.Common
{
    [Serializable]
    public abstract class PropertyNotifier
    {
        #region Events

        [field: NonSerialized]
        public event PropertyChangedEventHandler PropertyChanged;

        #endregion

        public PropertyNotifier()
            : base()
        {
            this.AllowRaiseEvent = true;
        }

        #region Properties

        [XmlIgnore]
        protected bool AllowRaiseEvent
        {
            get;
            set;
        }

        #endregion

        #region INotifyPropertyChanged Members

        protected void OnPropertyChanged(string propertyName)
        {
            if (this.AllowRaiseEvent)
            {
                if (!object.ReferenceEquals(this.PropertyChanged, null))
                {
                    this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
                }
            }
        }

        #endregion
    }
}
