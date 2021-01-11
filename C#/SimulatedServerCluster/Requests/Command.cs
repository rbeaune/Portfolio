// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// Command

using System;

namespace Assi3
{
    interface Command
    {
        int Execute(Route route);
    }
}
