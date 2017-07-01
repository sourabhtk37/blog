+++
title = "Why Does A Blog Need HTTPS?"
date = 2017-07-02T02:21:09+05:30
slug = ""
tags = []
categories = ["security"]
draft = false
+++

I was at the [Ilug-D meet-up](//ilugd.github.io/), while talking about this blog a friend asked me:

> Why the need for HTTPS in a blog?

I couldn't answer it accurately. To answer the question accurately, understanding two things is enough:

- What's wrong with talking over `insecure HTTP`?
- Why use `HTTPS`?

##### What's wrong with talking over insecure HTTP?
When you are using an insecure http request to access a website:
    
- It could be a attacker impersonating as the said website you are visiting. This could lead to phishing and 
the attacker may lure you into giving up your private information.

- One can modify or tamper any data moving between the user and the webserver. This means attackers, ISP, or 
anyone really can inject ads, insert malicious scripts etc, sometimes even tricking users to download malware.
This is a common scenario in open public wifi. This also mean that the `user experience(UX)` of your webpage 
`goes down` significantly.

- It can reveal user behaviour and identity of the user.


These man-in-the-middle are quite harmful for the normal functioning of your webpage and the privacy of your user.

##### Why use HTTPS?
**All of the above stated problems with insecure HTTP are solved by HTTPS.**

---

Now to explain a bit more as to why should one be using HTTPS than insecure HTTP in a traditional website:

- Almost all modern browser are restricting access to resources like location, push notification, payments
over insecure HTTP. Most features are deprecated in HTTP. They are only available on HTTPS.

- Google search uses HTTPS as a ranking signal. Read about it [here](//webmasters.googleblog.com/2014/08/https-as-ranking-signal.html).

- You can safely grant access to the private information (like geo-location) to the website as it's verified by the certificate authority.

- HTTP/2 features are available only on HTTPS.

- The performance of TLS (SSL is not used nowadays, but people still refer TLS as SSL) is catching up with HTTP. [Check here](//istlsfastyet.com)

- The performance debate can be countered by performance gain by using features of HTTP/2. [Check here](//www.httpvshttps.com/)

One can buy SSL/TLS certificate from various certificate authorities and enable HTTPS on their webpage.

[Let's Encrypt](//letsencrypt.org/) is non-profit and open certificate authority that provides `free SSL/TLS certificates` and have automated 
scripts for obtaining and renewal of certificates. They have issued more than 100 Million certificates so far and get funds 
via crowdfunding and various sponsors.

[Check](//www.ssllabs.com/ssltest/) how secure is your HTTPS connection.

---

To read more:

- [Why HTTPS Matters](//developers.google.com/web/fundamentals/security/encrypt-in-transit/why-https)
- [Why do websites use HTTPS when they don't need to?](//security.stackexchange.com/questions/52856/why-do-websites-use-https-when-they-dont-need-to)
- [Why HTTPS Is Not For Everyone?](//www.cloudways.com/blog/why-to-use-https/)
- [Should a site have SSL if it doesn't have a login form?](//security.stackexchange.com/questions/38832/should-a-site-have-ssl-if-it-doesnt-have-a-login-form)

More on what and how to enable HTTPS:

- [Important Security Terminology](//developers.google.com/web/fundamentals/security/encrypt-in-transit/intro-to-security-terminology)
- [Enabling HTTPS on Your Servers](//developers.google.com/web/fundamentals/security/encrypt-in-transit/enable-https)

