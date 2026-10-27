import SwiftUI

struct UserAgreementView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Оферта на оказание образовательных услуг дополнительного образования Яндекс.Практикум для физических лиц")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Данный документ является действующим, если расположен по адресу: https://yandex.ru/legal/practicum_offer\n\nРоссийская Федерация, город Москва")
                
                Text("1. ТЕРМИНЫ")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Понятия, используемые в Оферте, означают следующее:\n\nАвторизованные адреса — адреса электронной почты каждой Стороны. Авторизованным адресом Исполнителя является адрес электронной почты, указанный в разделе 11 Оферты. Авторизованным адресом Студента является адрес электронной почты, указанный Студентом в Личном кабинете.\n\nВводный курс — начальный Курс обучения по представленным на Сервисе Программам обучения в рамках выбранной Студентом Профессии или Курсу, рассчитанный на определенное количество часов самостоятельного обучения, который предоставляется Студенту единожды при регистрации на Сервисе на безвозмездной основе.")
            }
            .padding()
            .font(.system(size: 17, weight: .regular))
            .foregroundStyle(ColorConstants.black)
        }
        .navigationTitle("Пользовательское соглашение")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(ColorConstants.black)
                        }
                    )
    }
}

#Preview {
    NavigationStack{
        UserAgreementView()
    }
}
