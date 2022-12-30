using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace DiningPhilosophers
{
    class Fork
    {
        public Semaphore sem = new Semaphore(1, 1);
    }

}
