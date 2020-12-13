using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using Newtonsoft.Json;
using CsvHelper;
using System.Xml.Serialization;

namespace Project1_Final
{
    [XmlRoot("CanadaCities")]
    public class CanadaCities
    {
        [XmlElement("CanadaCity")]
        public List<CityDeserialized> CanadaCity { get; set; }
    }

    public class CityDeserialized
    {
        public string city { get; set; }
        public string city_ascii { get; set; }
        public double lat { get; set; }
        public double lng { get; set; }
        public string country { get; set; }
        public string admin_name { get; set; }
        public string capital { get; set; }
        public int population { get; set; }
        public string id { get; set; }
    }
    public static class Deserializer
    {
        public static Dictionary<string, CityInfo> DeserializeJSON(string filepath)
        {
            var currentDirectory = Directory.GetCurrentDirectory();
            var path = currentDirectory + "\\" + filepath;
            if (!File.Exists(path))
            {
                throw new FileNotFoundException();
            }

            var jsonFile = File.ReadAllText(path);



            List<CityDeserialized> citiesDeseralized = JsonConvert.DeserializeObject<List<CityDeserialized>>(jsonFile);

            return ConvertListToDictionary(citiesDeseralized);
        }

        public static Dictionary<string, CityInfo> DeserializeCSV(string filepath)
        {
            var currentDirectory = Directory.GetCurrentDirectory();
            var path = currentDirectory + "\\" + filepath;
            if (!File.Exists(path))
            {
                throw new FileNotFoundException();
            }

            IEnumerable<CityDeserialized> records;
            var recordList = new List<CityDeserialized>();
            using (var reader = new StreamReader(path))
            {
                using (var csv = new CsvReader(reader))
                {
                    records = csv.GetRecords<CityDeserialized>();

                    recordList = records.ToList();
                }
            }

            return ConvertListToDictionary(recordList);

        }

        public static Dictionary<string, CityInfo> DeserializeXML(string filepath)
        {
            var currentDirectory = Directory.GetCurrentDirectory();
            var path = currentDirectory + "\\" + filepath;
            if (!File.Exists(path))
            {
                throw new FileNotFoundException();
            }
            CanadaCities xmlResult;
            XmlSerializer serializer = new XmlSerializer(typeof(CanadaCities));
            using (FileStream fileStream = new FileStream(path, FileMode.Open))
            {
                xmlResult = (CanadaCities)serializer.Deserialize(fileStream);
            }

            return ConvertListToDictionary(xmlResult.CanadaCity);
        }

        private static Dictionary<string, CityInfo> ConvertListToDictionary(List<CityDeserialized> citiesDeseralized)
        {
            Dictionary<string, CityInfo> result = new Dictionary<string, CityInfo>();
            foreach (var city in citiesDeseralized)
            {
                var newCity = new CityInfo();
                newCity.CityName = city.city;
                newCity.CityID = city.id;
                newCity.CityAscii = city.city_ascii;
                newCity.Population = city.population;
                newCity.Province = city.admin_name;
                newCity.Latitude = city.lat;
                newCity.Longitude = city.lng;
                if (result.ContainsKey(newCity.CityName))
                {

                }
                else
                {
                    result.Add(newCity.CityName, newCity);
                }
            }
            return result;
        }
    }
}
