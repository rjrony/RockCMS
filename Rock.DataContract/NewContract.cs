using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Rock.DataContract
{
    public class NewContract
    {

        public int ID { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime CreateDate { get; set; }
    }
}
