# Various Protocols, 3rd grade explanations, and Ports

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

## [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) Port: 80

- Make requests to servers from the client to server without securing the connection.
    1. Client/Server Model, request/response
    1. Stateless - no need to retain information... cookies for that
    1. Most of the time uses TCP/IP as transport level protocol, itself is the application level.
    1. using client actions to determine behavior (GET/POST/DELETE).
    1. Server status codes
    1. Headers
- I have a refrigerator I want to add food to the refrigerator so I PUT or POST some food for consumption later.  I can GET the food and DELETE it once it is no longer in the fridge anymore.  Anyone can take my food though and then I might go hungry and eventually die.

## [HTTPS](https://en.wikipedia.org/wiki/HTTPS)

- SSL certificate is like an online certification card, information is passed only once verification occurs with the authority. Secure socket layer determines the encryption and the data in transmission is completely encrypted.
- Get your certs [here](https://letsencrypt.org/)
- Similarly to my refrigerator example before, EXCEPT now I have a gaurd dog that only likes people that I give an access card to my fridge for.  That way when Paul tries to eat my last slice of pizza, my dog won't let him in.

### Client/Server Model

Best thought about as customer/kitchen relationship.  I the customer goes in to a store and ask for a burger, the kitchen responds and gets me one. (Http/ssh/telnet/ftp)