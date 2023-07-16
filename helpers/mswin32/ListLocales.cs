using System;
using System.Globalization;

public class SamplesCultureInfo {

    public static void Main() {
        foreach (
            CultureInfo ci in 
            CultureInfo.GetCultures(CultureTypes.AllCultures)
        ) {
            Console.WriteLine("{0}|{1}", ci.Name, ci.EnglishName);
        }
    }
}
