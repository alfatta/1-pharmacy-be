const nodemailer = require('nodemailer')

const transporter = nodemailer.createTransport({
  host: "smtp.mailtrap.io",
  port: 2525,
  auth: {
    user: "df7b9e8807f278",
    pass: "85ad9558a3dc21"
  }
});


module.exports.sendEmail = (to, subject, text, html) => {
  return transporter.sendMail({
    from: '"Naufal Dzulfikar" <noreply@example.com>',
    to,
    subject,
    text,
    html,
  })
}
