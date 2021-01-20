# Sweater Weather

Sweater weather is an application that mimics a working in a service-oriented architecture.

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Getting Started

To get started, clone this repo and run the following commands:

```
$ bundle install
$ rails db:{create,migrate}
```

Next you will need to run `rails credentials:edit` and setup you credentials file like this:

```
openweathermap:
  api_key: YOUR_API_KEY_HERE

mapquest:
  api_key: YOUR_API_KEY_HERE

unsplash:
  api_key: YOUR_API_KEY_HERE
```

To get your own api keys you can visit the following sites:

- [OpenWeather Map](https://openweathermap.org/api)
- [MapQuest](https://developer.mapquest.com/)
- [Unsplash](https://unsplash.com/developers)

## Endpoints

To hit these endpoints locally, start your rails server `$ rails s`

Each endpoint should be prefixed with `http://localhost:3000/`

### Forecast

```
Retrieves current, daily, and hourly weather for a city.


GET /api/v1/forecast



Parameter      Type        Description

location       String      The city where you want to find the weather.
```
```json
Default response

{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-01-19 21:03:52 -0600",
                "sunrise": "2021-01-19 06:55:45 -0600",
                "sunset": "2021-01-19 16:59:45 -0600",
                "temperature": 46.2,
                "feels_like": 38.46,
                "humidity": 53,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03n"
            },
            "daily_weather": [
                {
                    "date": "2021-01-19",
                    "sunrise": "2021-01-19 06:55:45 -0600",
                    "sunset": "2021-01-19 16:59:45 -0600",
                    "max_temp": 53.26,
                    "min_temp": 41.81,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-01-20",
                    "sunrise": "2021-01-20 06:55:19 -0600",
                    "sunset": "2021-01-20 17:00:47 -0600",
                    "max_temp": 44.83,
                    "min_temp": 34.05,
                    "conditions": "clear sky",
                    "icon": "01d"
                },

                ETC...
            ],
            "hourly_weather": [
                {
                    "time": "9:00PM",
                    "temperature": 46.2,
                    "wind_speed": "7 mph",
                    "wind_direction": "from NW",
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "10:00PM",
                    "temperature": 44.47,
                    "wind_speed": "7 mph",
                    "wind_direction": "from W",
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },

                ETC...
            ]
        }
    }
}
```

### Backgrounds

```
Retrieves a background image for a city.


GET /api/v1/backgrounds



Parameter      Type        Description

location       String      The city you want to find an image for.
```
```json
Default response

{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "photographer": "cody lannom",
                "profile": "https://unsplash.com/@codylannom",
                "hosting_site": "https://www.unsplash.com",
                "image_location": "nashville,tn",
                "image_url": "https://images.unsplash.com/photo-1586732538632-47e539174a1c?ixid=MXwxOTkzNDd8MHwxfHNlYXJjaHwxfHxuYXNodmlsbGUsdG58ZW58MHx8fA&ixlib=rb-1.2.1"
            }
        }
    }
}
```

### User

```
Creates a new user.

POST /api/v1/users
Content-Type: application/json
Accept: application/json


Raw json body

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

```json
Default response

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Login

```
Authenticates an existing user.

POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

Raw json body

{
  "email": "whatever@example.com",
  "password": "password"
}
```
```json
Default response

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Road Trip

```
Allows a user to plan road trips.

POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

Raw json body

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
```json
Default response

{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Pueblo, CO",
      "travel_time": "1 hour(s), 51 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy"
      }
    }
  }
}
```
