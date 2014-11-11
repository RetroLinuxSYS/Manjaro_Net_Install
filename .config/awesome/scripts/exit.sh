ogg123 -q "${HOME}/.config/awesome/audio/shutdown.ogg" &
sleep 5
# exit awesome
echo 'awesome.quit()' | awesome-client
shutdown -h now
# exit script
exit 0
