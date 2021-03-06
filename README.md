# GitHub Login with Pow for Phoenix

An example of using [Pow](https://hexdocs.pm/pow/) with [PowAssent](https://hexdocs.pm/pow_assent/) to provide Login with GitHub for a [Phoenix app](https://www.phoenixframework.org).

## Why Pow?

It's really easy to setup, is fully featured and can be customised as you need which makes it perefect for getting up and running quickly without getting in your way later on.

## Getting started

To get started:

- Install dependencies with `mix deps.get`
- Get GitHub OAuth details and populate a [.env](/.env) file with the details (see [.env.example](/.env.example))
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `source .env && mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## About me

I'm [Seth](https://sethcorker.com/) and I have a blog about [web development with some Elixir posts](https://blog.sethcorker.com/topics/elixir/).
