using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using Newtonsoft.Json;

namespace Project1_Final
{
    public class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                GenerateHelpScreen();
            }
            else
            {
                Statistics statistics = new Statistics();
                switch (args[0])
                {
                    case "--h":
                        if (args.Length == 1)
                        {
                            GenerateHelpScreen();
                        }
                        break;
                    case "--s":
                        if (args.Length == 2)
                        {
                            Console.WriteLine(args[1]);
                            if (Path.HasExtension(args[1]))
                            {
                                Console.WriteLine("The file path has an extension");
                                Statistics fileStats = new Statistics(Path.GetFileName(args[1]), Path.GetExtension(args[1]));
                                statistics = fileStats;
                            }
                            else
                            {
                                Console.WriteLine("Input value is not a file type.");
                            }
                        }
                        break;
                }
                if (statistics.CityCatalogue.Count != 0 && args.Length != 0)
                {
                    GenerateOptionScreen(ref statistics, args[1]);
                }
            }
        }
        public static void GenerateHelpScreen()
        {
            Console.WriteLine("************************************City Viewer Program**********************************");
            Console.WriteLine();
            Console.WriteLine("Options:");
            Console.WriteLine("\t--h, --help            Shows help screen");
            Console.WriteLine("\t--s [Filename]         Command with the filename will load city list into program");
        }

        public static void GenerateOptionScreen(ref Statistics stats, string filename)
        {
            Console.WriteLine($"Cities from {filename} loaded into program. What would you like to do now?");
            Console.WriteLine("\nDisplay City Information:              --city");
            Console.WriteLine("Display Cities in Province:            --prov");
            Console.WriteLine("Calculate Province Population:         --pop");
            Console.WriteLine("Compare Population of Cities:          --comp");
            Console.WriteLine("Calculate Distance Between Cities:     --dist");
            Console.WriteLine("Exit program                           --exit or CTRL-C");
            string choice = "";
            do
            {
                Console.Write("\nPlease Enter Choice: ");
                choice = Console.ReadLine();
                Console.WriteLine();

                if (choice == "--city")
                    StartCityPrompt(ref stats);
                else if (choice == "--prov")
                    StartProvincePrompt(ref stats);
                else if (choice == "--pop")
                    StartPopulationCitiesPrompt(ref stats);
                else if (choice == "--comp")
                    StartComparePopPrompt(ref stats);
                else if (choice == "--dist")
                    StartDistancePrompt(ref stats);
                else if (choice == "--exit")
                    break;
                else
                    Console.WriteLine("Incorrect input. Please try again.");
            } while (true);
        }

        public static void StartCityPrompt(ref Statistics stats)
        {
            Console.Write("Enter City Name: ");
            string cityName = Console.ReadLine();

            Console.WriteLine(stats.DisplayCityInformation(cityName));
        }
        public static void StartProvincePrompt(ref Statistics stats)
        {
            Console.Write("Enter Province Name: ");
            string provinceName = Console.ReadLine();

            Console.WriteLine(stats.DisplayProvinceCities(provinceName));
        }
        public static void StartPopulationCitiesPrompt(ref Statistics stats)
        {
            Console.Write("Enter Province Name: ");
            string province = Console.ReadLine();
            Console.WriteLine(stats.CalculateProvincePopulation(province));
        }
        public static void StartComparePopPrompt(ref Statistics stats)
        {
            Console.Write("Enter First City Name: ");
            string firstCity = Console.ReadLine();

            Console.Write("Enter Second City Name: ");
            string secondCity = Console.ReadLine();

            Console.WriteLine(stats.MatchCities(firstCity, secondCity));
        }
        public static void StartDistancePrompt(ref Statistics stats)
        {
            Console.Write("Enter First City Name: ");
            string firstCity = Console.ReadLine();

            Console.Write("Enter Second City Name: ");
            string secondCity = Console.ReadLine();

            Console.WriteLine(stats.DistanceBetweenCities(firstCity, secondCity));
        }
    }
}
