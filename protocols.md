# Various TCP/UDP Protocols, 3rd grade explanations with Ports

- Application layer passes messages to the transport layer called a segment, containing the source port and destination port.  Then passed on to the network layer.

## [TCP/IP](https://en.wikipedia.org/wiki/Internet_protocol_suite)

- connection based (20 byte headers), must negotiate a connection first
    1. Initiator Request: Wanna connect?
    1. Acceptor Response: Sure.
    1. Initator acknolegement
- Retransmission for no delivery acknowledgement, sending packets that may have failed or been lost
- TCP can rearrange ordering of packages to be correct and delays transmission when network is congested.  Checksum manditory for both ipv4/6
- Stream oriented
- UseCase: any time you need to gaurentee package deliveries, text communication, file delivery, acknowledgements, if bandwidth is there run multimedia

## [UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol)

- Smaller packet sizes than TCP (8 byte headers)
- Connectionless to create and maintain the request
- on curruption, the bad segment gets discarded or kept with a warning flag, with no compensation
- no order or congestion control
- lightweight but not that reliable
- Message oriented
- UseCase: Skype for real time (if you can tolerate package loss), less latency, dns lookups

## [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) Port: 20-21

- Transport any type of file to and from a computer. Not generally protected, use SFTP for that.
    1. Log in to a server using username/password auth
    1. Push your files across the wire
- I want to put my note book in a locker before gym class, I find my locker, move the dial to unlock the latch open the locker, throw in my notebook and close the locker.

## [SSH](https://en.wikipedia.org/wiki/Secure_Shell) Port: 22

- Way more secure way to transmit data from one computer to another because of encryption.  SSH secures access to a computer, public key is used to encrypt a message and private key decifers it.
    1. Public key is on the ssh server and private key on client locally.
    1. Client sends a request using an id of the key pair it wants to use to prove its identity.
    1. Server sends a challenge encrypted with public key.
    1. Client decrypts with private key and sends it back to be verified.
    1. Connection established and you're good to go.
- I want to talk to Richard but don't want anyone else to hear what i'm saying. I set up a secret handshake where he completes the first half of the handshake by dancing around in a circle 3 times and whispers "birds".  Once I hear the word "birds" I jump up and down 4 times and reply with whispering "boogers" derived by our super secret language, back to him. Now we both know we can trust each other and no one else can understand what we're saying in our secret language.

## [TelNet](https://en.wikipedia.org/wiki/Telnet) Port: 23

- Old way to send data over the internet, plain text for everyone to see. All it requires is telnet to be installed on a server to use.
- It's like yelling across the lunch room knowing that anyone in the cafeteria can listen in and clearly understand what you are saying.
- Common use case would be commands to turn on ssh for a controller that has it turned off

## [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) Port: 25
- Client to server to server to client
- Email has been around since 1965, when you send an email you start in by sending text to an SMTP server that locates the SMTP server of your recipient with their domain name.  That SMTP server passes the message over to the POP3 server to receive the email.
- This protocol is like mailing a letter.  I package my letter up and put it in my local mail box, to get it to my Post Office(SMTP server), I have an address on the letter so that post office can transfer my letter to the post office nearest my friend.  They deliver it to my friend after passing the letter between post offices.

## [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) Port: 80

- Make requests to servers from the client to server without securing the connection.
    1. Client/Server Model, request/response
    1. Stateless - no need to retain information... cookies for that
    1. Most of the time uses TCP/IP as transport level protocol, itself is the application level.
    1. using client actions to determine behavior (GET/POST/DELETE).
    1. Server status codes
    1. Headers
- I have a refrigerator I want to add food to the refrigerator so I PUT or POST some food for consumption later.  I can GET the food and DELETE it once it is no longer in the fridge anymore.  Anyone can take my food though and then I might go hungry and eventually die.

## [HTTPS](https://en.wikipedia.org/wiki/HTTPS) Port: 443

- SSL certificate is like an online certification card, information is passed only once verification occurs with the authority. Secure socket layer determines the encryption and the data in transmission is completely encrypted.
- Get your certs [here](https://letsencrypt.org/)
- Similarly to my refrigerator example before, EXCEPT now I have a gaurd dog that only likes people that I give an access card to my fridge for.  That way when Paul tries to eat my last slice of pizza, my dog won't let him in.

## [Artnet](https://en.wikipedia.org/wiki/Art-Net) Port: Not reserved

- A protocol for transmitting the DMX512-A lighting control protocol and Remote Device management (RDM) protocol over the User Datagram Protocol (UDP) of the Internet Protocol suite. It is used to communicate between "nodes" (e.g., intelligent lighting instruments) and a "server" (a lighting desk or general purpose computer running lighting control software). 

### Client/Server Model

Best thought about as customer/kitchen relationship.  I the customer goes in to a store and ask for a burger, the kitchen responds and gets me one. (Http/ssh/telnet/ftp)
