#
import time

from .logs import Logger
from .cli import StreamHandler
from .core import OnionServer

if __name__ == '__main__':

    logger = Logger.get()
    logger.add_handlers(
        StreamHandler()
    )

    server = OnionServer(
        address='localhost',
        port=7500,
        gateway='8.8.8.8',
        init_delay=3,
        deadtime=2,
        node_addresses=['localhost'],
        action_active='echo "ACTIVE"',
        action_passive='echo "PASSIVE"')

    server.serve_forever()

    time.sleep(10*1000)
