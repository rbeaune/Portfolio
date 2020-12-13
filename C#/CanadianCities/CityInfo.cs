using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1_Final
{
    public class CityInfo
    {
        //Class properties
        public string CityID { get; set; }
        public string CityName { get; set; }
        public string CityAscii { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string Province { get; set; }
        public long Population { get; set; }

        //Class methods
        public List<double> GetLocation()
        {
            return new List<double> { this.Latitude, this.Longitude };
        }
    }
}
