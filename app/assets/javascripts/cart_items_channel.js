socket = new WebSocket("ws://localhost:3000/cable");
socket.onmessage = function(evt) {
  let nmsg = JSON.parse(evt.data);
  if (nmsg.type === "ping") {
    return;
  }
  console.log(JSON.stringify(nmsg));
};
const msg = {
        command: 'subscribe',
        identifier: JSON.stringify({
          channel: 'CartItemsChannel',
        }),
      };
socket.send(JSON.stringify(msg));
