# Services - TempoService

We have to create a user for to login us

```ruby
let user = ECIUser(eci_user_id: "YOUR_USER_NAME", type: "TYPE_USER")
```

For web services, we will use the TempoService class. We have a list of available services:

* login
* listCenters
* getCenter

## login
return -> ECIUser
```ruby
TempoService.login(user: userECI, sendSuccessCompletion: { (userData) in
            print("Success")
        }) { (message) in
            print(message)
        }
```

## listCenters
return -> Array[ECICenterList]
```ruby
TempoService.listCenters(sendSuccessCompletion: { (centers) in
            print("Success")
         }) { (message) in
            print(message)
         }
```

## getCenter
return -> ECICenter
```ruby
TempoService.getCenter(center_id: "CENTER_ID", sendSuccessCompletion: { (center) in
            print("Success")
        }) { (message) in
            print(message)
        }
```
