# radgov

A cli tool for interacting with the Radicle governance contracts.

It can be used to create, view, vote on, or execute proposals using a
keyfile or a hardware wallet.

## Installation

Install nix:
```
curl https://nixos.org/nix/install | sh

# Run this or login again to use Nix
. "$HOME/.nix-profile/etc/profile.d/nix.sh"
```

Then install `radgov`:
```
nix-env -i -f https://github.com/dapphub/dapptools/archive/master.tar.gz
```

## Configuration

`radgov` can be configured using the following flags and environment variables:

| Flag          | Variable        | Default                            | Synopsis                            |
| ------------- | --------------- | ------------                       | ---------------                     |
| `--rpc-url`   | `ETH_RPC_URL`   | n/a                                | url to rpc node                     |
| `--keystore`  | `ETH_KEYSTORE`  | geth & parity default locations    | dir to look for keyfiles            |
|               | `ETH_HDPATH`    | `"m/44'/60'/0'/0"` (ledger legacy) | derivation path for hardware walets |
| `--from`      | `ETH_FROM`      | n/a                                | sender                              |
| `--gas`       | `ETH_GAS`       | node decides                       | gas quantity                        |
| `--gas-price` | `ETH_GAS_PRICE` | node decides                       | gas price                           |
| `--value`     | `ETH_VALUE`     | `0`                                | ether value                         |
|               | `RAD`           | TBD                                | Radicle token address               |
|               | `RADGOV`        | TBD                                | Radicle governance contract address |

## Usage

Run `radgov help` for an overview or
`radgov <command> --help` for help relating to a specific command.

```
Usage: radgov [<options>] <command> [<args>]
   or: radgov <command> --help

Connection options:

   --rpc-host=<host>          JSON-RPC host (default: `localhost')
   --rpc-port=<port>          JSON-RPC port (default: `8545')
   --rpc-url=<url>            JSON-RPC URL (overrides host and port)
   --rpc-accounts             use JSON-RPC node for accounts and signing
   -C, --chain=<chain>        remote node configuration preset
   --keystore=<dir>           local keystore directory

Transaction options:

   -F, --from=<sender>        account to send transaction from
   -G, --gas=<number>         number of gas units to provide
   -P, --gas-price=<number>   price (in wei) of each gas unit
   -N, --nonce=<number>       nonce value to use for the transaction
   -V, --value=<number>       amount (in wei) of ETH to send
   -S, --password=<file>      password for non-interactive signing

Commands:

   account         print rad balance and voting power of the given account
   actions         show proposal actions
   cancel          cancel a proposal
   delegate        delegate votes
   execute         execute a proposal
   ls              list current proposals
   proposal        view a governance proposal
   propose         make a governance proposal
   queue           queue a proposal
   receipt         get a voting receipt for a proposal
   state           view the state of a proposal
   vote            vote on a proposal

Report bugs to <https://github.com/dapp-org/radgov/issues/new>.
```


## Advanced

radgov is built using https://github.com/dapphub/dapptools, in particular [`seth`](https://github.com/dapphub/dapptools/tree/master/src/seth).
Environment flags recognized by `seth` will also effect the `radgov` tool.

