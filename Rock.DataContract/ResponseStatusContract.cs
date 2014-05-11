using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Rock.DataContract
{
    public enum OperationStatus
    {
        Success,
        Error
    }

    public class ResponseStatusContract
    {

        public OperationStatus Status { get; set; }

        public string Msg { get; set; }

    }
}
