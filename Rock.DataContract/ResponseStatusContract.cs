using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Rock.DataContract
{
    public enum Status
    {
        Success,
        Error
    }

    public class ResponseStatusContract
    {

        public Status Status { get; set; }

        public string Msg { get; set; }

    }
}
