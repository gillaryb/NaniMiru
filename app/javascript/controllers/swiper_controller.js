import { Controller } from "@hotwired/stimulus"
import Hammer from 'hammerjs'

// Connects to data-controller="swiper"
export default class extends Controller {
  static targets = ['container', 'card', 'buttons']

  connect() {
    // var this.containerTarget = document.querySelector('.tinder');
    // var this.cardTargetss = document.querySelectorAll('.tinder--card');
    // var nope = document.getElementById('nope');
    // var love = document.getElementById('love');
    console.log(this.cardTargets)

    this.#initCards();
    this.cardTargets.forEach((el) => {
      var hammertime = new Hammer(el);

      hammertime.on('pan', (event) => {
        el.classList.add('moving');
      });

      hammertime.on('pan', (event) => {
        if (event.deltaX === 0) return;
        if (event.center.x === 0 && event.center.y === 0) return;

        this.containerTarget.classList.toggle('tinder_love', event.deltaX > 0);
        this.containerTarget.classList.toggle('tinder_nope', event.deltaX < 0);

        var xMulti = event.deltaX * 0.03;
        var yMulti = event.deltaY / 80;
        var rotate = xMulti * yMulti;

        event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
      });

      hammertime.on('panend', (event) => {
        el.classList.remove('moving');
        this.containerTarget.classList.remove('tinder_love');
        this.containerTarget.classList.remove('tinder_nope');

        var moveOutWidth = document.body.clientWidth;
        var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

        event.target.classList.toggle('removed', !keep);

        if (keep) {
          event.target.style.transform = '';
        } else {
          this.#hideButtons()
          var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
          var toX = event.deltaX > 0 ? endX : -endX;
          var endY = Math.abs(event.velocityY) * moveOutWidth;
          var toY = event.deltaY > 0 ? endY : -endY;
          var xMulti = event.deltaX * 0.03;
          var yMulti = event.deltaY / 80;
          var rotate = xMulti * yMulti;
          const url = event.target.dataset.url
          this.#submit(url, endX > 0)

          event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
          this.#initCards();
        }
      });
    });



    // var nopeListener = createButtonListener(false);
    // var loveListener = createButtonListener(true);

    // nope.addEventListener('click', nopeListener);
    // love.addEventListener('click', loveListener);

  }

  accepted(event) {
    event.preventDefault()
    this.#hideButtons()
    const url = event.target.dataset.url
    this.#vote(true)
    this.#submit(url, true)
  }

  rejected(event){
    event.preventDefault()
    this.#hideButtons()
    const url = event.target.dataset.url
    this.#vote(false)
    this.#submit(url, false)
  }

  #initCards(card, index) {
    var newCards = document.querySelectorAll('.tinder--card:not(.removed)');
    document.querySelectorAll('.tinder--card + :not(.removed)')[0].classList.remove('d-none');

    newCards.forEach((card, index) => {
      card.style.zIndex = this.cardTargets.length - index;
      card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
      card.style.opacity = (10 - index) / 10;
    });

    this.containerTarget.classList.add('loaded');

  }

  #hideButtons() {
    document.querySelector('.tinder--card + :not(.removed)').classList.add('removed');
  }

  #vote(love) {
    var cards = document.querySelectorAll('.tinder--card:not(.removed)');
    var moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    var card = cards[0];

    card.classList.add('removed');

    if (love) {
      card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
    } else {
      card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
    }

    this.#initCards();
  }

  #submit(url, love) {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    fetch(url, {
      method: 'post',
      headers: { "X-CSRF-Token": csrfToken, "Content-Type": 'application/json', 'Accept': 'application/json' },
      body: JSON.stringify({
        swipe: {
          status: love ? 'accepted' : 'rejected'
        }
      })
    })
    .then((data) => {
      console.log(data)
    })
  }
}
