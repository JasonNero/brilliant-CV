/*
* Functions for the CV template
*/

#import "./utils/styles.typ": *

#let _letterHeader(
  myAddress: "Your Address Here",
  recipientName: "Company Name Here",
  recipientAddress: "Company Address Here",
  date: "Today's Date",
  subject: "Subject: Hey!",
  metadata: metadata,
  awesomeColors: awesomeColors,
) = {
  let accentColor = setAccentColor(awesomeColors, metadata)

  let letterHeaderNameStyle(str) = {
    text(fill: accentColor, weight: "bold", str)
  }
  let letterHeaderAddressStyle(str) = {
    text(fill: gray, size: 0.9em, smallcaps(str))
  }
  let letterDateStyle(str) = {
    text(size: 0.9em, str)
  }
  let letterSubjectStyle(str) = {
    text(fill: accentColor, weight: "bold", str)
  }

  align(right,
    letterHeaderNameStyle(metadata.personal.first_name + " " + metadata
      .personal
      .last_name)
  )
  v(1pt)
  align(right, letterHeaderAddressStyle(myAddress))
  v(1pt)
  align(left, letterHeaderNameStyle(recipientName))
  v(1pt)
  align(left, letterHeaderAddressStyle(recipientAddress))
  v(1pt)
  align(right, letterDateStyle(date))
  v(1pt)
  letterSubjectStyle(subject)
  linebreak()
  linebreak()
}

#let _letterSignature(img) = {
  set image(width: 25%)
  linebreak()
  place(left, dx: -2%, dy: 1%, img)
}

#let _letterFooter(metadata) = {
  // Parameters
  let firstName = metadata.personal.first_name
  let lastName = metadata.personal.last_name
  let footerText = metadata.lang.at(metadata.language).letter_footer

  // Styles
  let footerStyle(str) = {
    text(size: 8pt, fill: rgb("#999999"), smallcaps(str))
  }

  return table(
    columns: (1fr, auto),
    inset: 0pt,
    stroke: none,
    footerStyle([#firstName #lastName]),
    footerStyle(metadata.lang.at(metadata.language).letter_footer),
  )
}
