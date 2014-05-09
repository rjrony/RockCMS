using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;

using Rock.DataContract;

namespace Rock.Common
{
    public static class ObjectContextExtension
    {

        public static IQueryable<T> GetPagedList<T>(this IOrderedQueryable<T> context, PagedParamContract pagedParam)
            where T : class
        {
            pagedParam.TotalCount = context.Count();
            return context.Skip((pagedParam.PageIndex - 1) * pagedParam.PageSize).Take(pagedParam.PageSize);
        }

    }
}
