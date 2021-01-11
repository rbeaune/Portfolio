// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// Multiply4Route

using System;

namespace Assi3
{
    class Multiply4Route : Route
    {
        public Multiply4Route(string path, Route next = null) : base(path, next) {}

        public override int Handle(int arg)
        {
            return arg * 4;
        }
    }
}
