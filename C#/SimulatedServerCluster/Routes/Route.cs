// Simulated Server Cluster
// April 24, 2020
// Raymond Beaune
//
// Route

using System;

namespace Assi3
{
    class Route
    {
        private Route Next;
        private string Path;

        public Route(string path, Route next = null) {
            this.Path = path;
            this.Next = next;
        }

        public int HandleRequest(Request r)
        {
            if (Path == r.Route)
                return Handle(r.Payload);

            if (Next != null)
                return Next.HandleRequest(r);

            // If neither this nor the next Route can handle the request,
            // return 404 by default
            return 404;
        }

        public virtual int Handle(int arg)
        {
            return 404; // Return 404 by default
        }
    }
}
