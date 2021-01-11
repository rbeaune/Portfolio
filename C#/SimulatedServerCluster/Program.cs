// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// Main

using System;
using System.Collections.Generic;

namespace Assi3
{
    class Program
    {
        static void Main(string[] args)
        {
            // Setup Server list and Request queue
            List<Server> Servers = new List<Server>();
            Queue<Request> PendingRequests = new Queue<Request>();

            // Create a ServerQuery to use later
            ServerQuery serverQuery = new ServerQuery();

            // Start user input
            Console.WriteLine("Please enter a command.");
            string command = "";

            while(command != "quit") {
                string[] commandArgs = command.Split(":");
                Console.WriteLine();

                switch(commandArgs[0]) {
                    // Print help text
                    case "help":
                        Console.WriteLine("help\t\t\tDisplay this menu");
                        Console.WriteLine("createserver\t\tCreate a new server.");
                        Console.WriteLine("deleteserver:[id]\tDelete server #ID.");
                        Console.WriteLine("listservers\t\tList all servers.");
                        Console.WriteLine("new:[path]:[payload]\tCreate a new pending request.");
                        Console.WriteLine("dispatch\t\tSend a pending request to a server.");
                        Console.WriteLine("server:[id]\t\tHave server #ID execute its pending request and print the result.");
                        Console.WriteLine("quit\t\t\tQuit the application");
                        break;
                    // Create a server
                    case "createserver":
                        Servers.Add(new Server());
                        Console.WriteLine("Created Server " + (Servers.Count - 1));
                        break;
                    // Delete a server
                    case "deleteserver":
                        int index = int.Parse(commandArgs[1]);
                        Servers.RemoveAt(index);
                        Console.WriteLine("Deleted Server " + index);
                        break;
                    // List all servers - if there are none, let the user know
                    case "listservers":
                        if (Servers.Count == 0)
                        {
                            Console.WriteLine("No servers available.");
                            break;
                        }
                        for (int i = 0; i < Servers.Count; ++i)
                            Console.WriteLine("Server " + i);
                        break;
                    // Create a new request
                    case "new":
                        string path = commandArgs[1];
                        int data = int.Parse(commandArgs[2]);
                        PendingRequests.Enqueue(new Request(path, data));
                        Console.WriteLine("Request created with data " + data + " going to " + path);
                        break;
                    // Find an available server and send them a pending request
                    case "dispatch":
                    // Have the specified server do their work
                    case "server":
                        Console.WriteLine("Unimplemented.");
                        break;
                    default:
                        if(command != "") {
                            Console.WriteLine("Invalid command.");
                        }
                        break;
                }

                Console.WriteLine();
                command = Console.ReadLine();
            }
        }
    }
}
