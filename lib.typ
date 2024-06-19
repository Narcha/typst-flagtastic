// Same arguments as the `image` element.
#let raw-flag(country_code, ..args) = {
  let country_code_list = json("flagpack-core/countryCodeList.json")

  let country = country_code_list.find((codes)=>{
    codes.values().any((code)=>{ code == country_code })
  })

  if country == none {
    panic("Invalid country code '" + country_code + "'")
  }

  image(
    "flagpack-core/svg/m/" + country.alpha2 + ".svg",
    alt: "Flag of " + country.countryName,
    ..args,
  )
}

// Arguments:
// - shape: one of rounded, circle, rectangle. Default: rectangle
// - radius: when shape == "rounded", specifies the border radius. Default: 20%
// - height: the flag's height. Default: 1em
// - width: the flag's width. Default: auto
// - baseline: the length to shift the baseline by. Default: 0.2em
#let flag(
  country_code,
  shape: "rectangle",
  radius: 15%,
  height: auto,
  width: auto,
  baseline: 0.2em,
) = {
  let radius = if shape == "rounded" { radius } else if shape == "circle" { 50% } else { 0% }

  if height == auto and width == auto {
    height = 1em
  }

  box(radius: radius, clip: true, baseline: baseline, raw-flag(
    country_code,
    height: height,
    width: if shape == "circle" { height } else { auto },
  ))
}

