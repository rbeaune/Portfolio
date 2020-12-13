using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;

namespace Project1_Final
{
    public class Statistics
    {
        //Class properties
        public Dictionary<string, CityInfo> CityCatalogue = new Dictionary<string, CityInfo>();

        //Constructor
        public Statistics ()
        {

        }
        public Statistics(string fname, string ext)
        {
            switch(ext)
            {
                case ".csv": CityCatalogue = new Dictionary<string, CityInfo>(Deserializer.DeserializeCSV(fname)); break;
                case ".json": CityCatalogue = new Dictionary<string, CityInfo>(Deserializer.DeserializeJSON(fname)); break;
                case ".xml": CityCatalogue = new Dictionary<string, CityInfo>(Deserializer.DeserializeXML(fname)); break;
                default: Console.WriteLine("Input extension is not supported"); break;
            }
        }

        //Class methods for grabbing information from the dictionary
        public string DisplayCityInformation(string cname)
        {
            CityInfo city = CityCatalogue[cname];
            return city.CityName + ", " + city.Province +
                "\nID: " + city.CityID +
                "\nPopulation: " + city.Population +
                "\n" + city.Latitude + " " + city.Longitude;
        }

        public string DisplayProvinceCities(string pname)
        {
            string cityList = "";
            foreach (KeyValuePair<string, CityInfo> entry in CityCatalogue)
            {
                if (entry.Value.Province == pname)
                    cityList += entry.Value.CityName + "\n";
            }


            return cityList;
        }

        public long CalculateProvincePopulation(string pname)
        {
            long totalPopulation = 0;

            foreach (KeyValuePair<string, CityInfo> entry in CityCatalogue)
            {
                if (entry.Value.Province == pname)
                    totalPopulation += entry.Value.Population;
            }

            return totalPopulation;
        }

        public string MatchCities(string cname1, string cname2)
        {
            if (CityCatalogue[cname1].Population > CityCatalogue[cname2].Population)
                return CityCatalogue[cname1].CityName + " has the highest population at: " + CityCatalogue[cname1].Population;
            else
                return CityCatalogue[cname2].CityName + " has the highest population at: " + CityCatalogue[cname1].Population;
        }

        public double DistanceBetweenCities(string cname1, string cname2)
        {
            var c1lat = CityCatalogue[cname1].Latitude;     //City1 Latitude
            var c1lng = CityCatalogue[cname1].Longitude;    //City1 Longitude
            var c2lat = CityCatalogue[cname2].Latitude;     //City2 Latitude
            var c2lng = CityCatalogue[cname2].Longitude;    //City2 Longitude

            //Calulcate distance using the Haversine Formula (found online to avoid using APIs)
            var R = 6378137; //Earth’s mean radius in meters
            var dLat = (c2lat - c1lat) * Math.PI / 180;
            var dLong = (c2lng - c1lng) * Math.PI / 180;
            var a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) +
              Math.Cos(c1lat * Math.PI / 180) * Math.Cos(c2lat * Math.PI / 180) *
              Math.Sin(dLong / 2) * Math.Sin(dLong / 2);
            var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
            var d = R * c;

            return d / 1000; // returns the distance in kilometers
        }
    }
}
