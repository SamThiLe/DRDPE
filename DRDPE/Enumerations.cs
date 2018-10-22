using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DRDPE
{
    public enum ProductStatus
    {
        Available = 1,
        Out_of_Stock = 2,
        Back_Ordered = 3,
        Temporarily_Available = 4,
        Discontinued = 5
    }

    public static class Enumeration
    {
        public static IDictionary<int, string> GetAll<TEnum>() where TEnum : struct
        {
            var enumerationType = typeof(TEnum);

            if (!enumerationType.IsEnum)
                throw new ArgumentException("Enumeration type is expected.");

            var dictionary = new Dictionary<int, string>();

            foreach (int value in Enum.GetValues(enumerationType))
            {
                var name = Enum.GetName(enumerationType, value);
                dictionary.Add(value, name);
            }

            return dictionary;
        }
    }
}