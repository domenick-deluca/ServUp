#!/usr/bin/expect

set username [lindex $argv 0];

exec echo $username
spawn nc -w 5 -v $username 22
expect {
	"timed out" {
		exec /servup/timed_out.sh $username 22
		send "\015"
	}
	"succeeded" {
		exec /servup/succeeded.sh $username 22
		send "\015"
	}
}
