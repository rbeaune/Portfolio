// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// AddRoute

using System;

namespace Assi3
{
    class AddRoute : Route
    {
        public AddRoute(string path, Route next = null) : base(path, next) {}

        public override int Handle(int arg)
        {
            return arg + 8;
        }
    }
}
