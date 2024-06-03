package main

import (
	"github.com/airchains-network/evm-station/cmd/station-evmd/cmd"
	"github.com/cosmos/cosmos-sdk/server"
	svrcmd "github.com/cosmos/cosmos-sdk/server/cmd"
	"github.com/evmos/evmos/v12/app"
	cmdcfg "github.com/evmos/evmos/v12/cmd/config"
	"os"
)

func main() {
	cmdcfg.RegisterDenoms()
	rootCmd, _ := cmd.NewRootCmd()

	if err := svrcmd.Execute(rootCmd, "evmosd", app.DefaultNodeHome); err != nil {
		switch e := err.(type) {
		case server.ErrorCode:
			os.Exit(e.Code)

		default:
			os.Exit(1)
		}
	}
}
