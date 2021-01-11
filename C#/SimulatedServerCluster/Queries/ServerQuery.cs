// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// ServerQuery

using System;

namespace Assi3
{
    class ServerQuery : Query
    {
        public bool CheckServer(Server s)
        {
            return s.Available();
        }
    }
}
