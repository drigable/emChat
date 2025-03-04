<!DOCTYPE html>
<html style="font-size: .625em">
	<head>
		<title>betclic.fr - FR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
	</head>
	<body>
		<style type='text/css'>
			/* @font-face{
				font-family: Metropolis;
				font-display: auto;
				src:url("https://www.betclic.pl/fonts/metropolis-black.woff2") format("woff2"),
					url("https://www.betclic.pl/fonts/metropolis-black.woff") format("woff")
			} */
				/*@font-face{
					font-family: Metropolis;
					font-display: auto;
					font-style: normal;
					font-weight: 300;
					src:url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF2/Metropolis-Light.woff2") format("woff2"),
						url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF/Metropolis-Light.woff") format("woff")
				}
				@font-face{
					font-family: Metropolis;
					font-display: auto;
					font-style: normal;
					font-weight: 400;
					src:url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF2/Metropolis-Regular.woff2") format("woff2"),
						url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF/Metropolis-Regular.woff") format("woff")
				}
				@font-face{
					font-family: Metropolis;
					font-display: auto;
					font-style: normal;
					font-weight: 700;
					src:url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF2/Metropolis-Bold.woff2") format("woff2"),
						url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF/Metropolis-Bold.woff") format("woff")
				}*/

			/* There is used Betclic color #d2161e */
			.embeddedServiceHelpButton .helpButton .uiButton {
				background-color: #d2161e;
				font-family: "Arial", sans-serif;
			}
			.embeddedServiceHelpButton .helpButton .uiButton:focus {
				outline: 1px solid #d2161e;
			}
		</style>
        <script type='text/javascript' src='https://betclicgroup--sept2024vm.sandbox.my.site.com/ESWMessagingforWeb1736881213811/assets/js/bootstrap.min.js' onload='initEmbeddedMessaging()'></script>
            <script type='text/javascript'>
                function initEmbeddedMessaging() {
                    try {
                        // Chat settings

                        // Override default behavior and hide the chat button at initialization
                        // It can be used to creat a custom button to lanch the chat like 'Click to contact support'
                        embeddedservice_bootstrap.settings.hideChatButtonOnLoad = true;
                        /*
                        French = 'fr'
                        English = 'en'
                        Polish = 'pl'
                        Portuguese (European) = 'pt-PT'
                        */
                        let language = 'en'; // fr/en/pl/pt-PT
                        embeddedservice_bootstrap.settings.language = language; // For example, enter 'en' or 'en-US'

                        // Hidden Pre-chat form details
                        let siteCode = 'frfr';
                        let sourceUid = 'Cl1234';
                        let applicationId = 'BETCLICFR';
                        let segment = 'Some segment';
                        let chatSource = 'BetclicFr';
                        let appVersion = 'Some app version';
                        let hasGoogleMobileServices = 'No'; // 'Yes' or 'No'
                        let isLoggedIn = 'No'; // 'Yes' or 'No'

                        //Pre-chat form fields
                        let username = ''; //If username is not blank the Pre-Chat form is skipped

                        // Init details
                        // salesforceOrgID - based on where Embedded Service Deployments is configured.
                        // For example for production org salesforceOrgID = '00D58000000JG9K'
                        let salesforceOrgID = '00DAa000009woNe';
                        // siteEndpointUrl - the path is unique for each Embedded Service Deployment. Domain part for production will be as follows
                        // 'https://betclicgroup.my.site.com'
                        let siteEndpointUrl = 'https://betclicgroup--sept2024vm.sandbox.my.site.com/ESWMessagingforWeb1736881213811';
                        // scrt2URL - for production the url will be as follows 'https://betclicgroup.my.salesforce-scrt.com'
                        let scrt2URL = 'https://betclicgroup--sept2024vm.sandbox.my.salesforce-scrt.com';

                        window.addEventListener("onEmbeddedMessagingReady", () => {
                            console.log("Received the onEmbeddedMessagingReady event…");

                            // Send data to Salesforce
                            // set visible prechat field
                            embeddedservice_bootstrap.prechatAPI.setVisiblePrechatFields({
                                // List the pre-chat field names with the value and whether
                                // it's editable in the pre-chat form.
                                "username": {
                                "value": username,
                                "isEditableByEndUser": true
                                }
                            });

                            //Set invisible prechat field
                            embeddedservice_bootstrap.prechatAPI.setHiddenPrechatFields({
                                "siteCode" : siteCode,
				"sourceUid": sourceUid,
                                "applicationId" : applicationId,
                                "segment" : segment,
                                "chatSource" : chatSource,
                                "appVersion" : appVersion,
                                "hasGoogleMobileServices" : hasGoogleMobileServices,
                                "isLoggedIn" : isLoggedIn
                            });
                        });

                        window.addEventListener("onEmbeddedMessagingPreChatSubmitted", (e) => {
                            console.log('Received the onEmbeddedMessagingPreChatSubmitted event…');
                            console.log(JSON.parse(JSON.stringify(e)));
                        });

                        // This event handler can be used to expose the custom button like 'Click to contact support'
                        // to run the chat using the utilAPI.launchChat() API call only when embeddedservice_bootstrap.utilAPI is ready.
                        window.addEventListener("onEmbeddedMessagingButtonCreated", (e) => {
                            console.log('Received the onEmbeddedMessagingButtonCreated');
                            let launchChatButton = document.getElementById("launchChatButton");
                            if (launchChatButton) {
                                launchChatButton.style.display = "block";  // Ensure it's shown
                            }
                        });

                        embeddedservice_bootstrap.init(
                            salesforceOrgID,
                            'Messaging_for_Web',
                            siteEndpointUrl,
                            {
                                scrt2URL: scrt2URL
                            }
                        );
                    } catch (err) {
                        console.error('Error loading Embedded Messaging: ', err);
                    }
                };
            </script>
            <script type='text/javascript'
                    src='https://betclicgroup--sept2024vm.sandbox.my.site.com/ESWMessagingforWeb1736881213811/assets/js/bootstrap.min.js'
                    onload='initEmbeddedMessaging()'
            >
            </script>

            <!-- Create a custom button or invitation to launch the web chat client. -->
            <button id="launchChatButton" style="display:none;" onclick="launchChat()">Click to contact support</button>

            <!-- Call Launch Chat API. -->
            <script>
                function launchChat() {
                    embeddedservice_bootstrap.utilAPI.launchChat()
                        .then(() => {
                            console.log('launchChat success')
                            // Success handler used to perform actions
                            // when the chat client launches successfully.
                            // For example, create a method that disables the launch chat button.
                            //disableLaunchChatButton();
                        }).catch(() => {
                            console.log('launchChat error')
                            // Error handler used to perform actions
                            // if the chat client fails to launch.
                            // For example, create a method that hides the launch chat button.
                            //hideLaunchChatButton();
                        }).finally(() => {
                            // Finally handler used to perform any clean-up actions
                            // regardless of whether the chat client launches successfully or not.
                            // For example, create a method that logs the user’s attempt to chat.
                            //logEndUserAttemptToChat();
                        });
                }
            </script>
	</body>
</html>
