// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// MultiplyRoute

using System;

namespace Assi3
{
    class MultiplyRoute : Route
    {
        public MultiplyRoute(string path, Route next = null) : base(path, next) {}

        public override int Handle(int arg)
        {
            return arg * 2;
        }
    }
}
