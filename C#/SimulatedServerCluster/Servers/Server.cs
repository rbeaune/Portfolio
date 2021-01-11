// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// Server

using System;
using System.Collections.Generic;

namespace Assi3
{
    class Server : AbstractServer
    {
        private Request request;
        Dictionary<string, Route> endpoints;

        public Server()
        {
        }
        public bool Available()
        {
            return request == null;
        }
        public bool Accept(Query q)
        {
            return q.CheckServer(this);
        }
        public void SetRequest(Request r)
        {
            request = r;
        }
    }
}
